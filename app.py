from flask import Flask, render_template, request, session, redirect
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail
import os
import math
from werkzeug.utils import secure_filename
import json
from datetime import datetime


with open('config.json','r') as c:
    params = json.load(c)["params"]


local_server=True
app = Flask(__name__)
app.secret_key="super-secret-key"
app.config['UPLOAD_FOLDER'] = params['upload_location']
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = True,
    MAIL_USERNAME = params['gmail-user'],
    MAIL_PASSWORD=  params['gmail-password']
)
mail = Mail(app)
if local_server==True:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db=SQLAlchemy(app)

class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(30), nullable=False)
    email = db.Column(db.String(50), nullable=False)
    phone_num = db.Column(db.String(30), nullable=False)
    msg = db.Column(db.String(500), nullable=False)
    date = db.Column(db.String(20))

class Posts(db.Model):
    #sno, title, slug, content, postedby, dateofpost, img_file
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(50), nullable=False)
    slug = db.Column(db.String(30), nullable=False)
    content = db.Column(db.String(5000), nullable=False)
    postedby = db.Column(db.String(50), nullable=False)
    dateofpost = db.Column(db.String(30))
    img_file=db.Column(db.String(30))

@app.route('/')
def home():
    #pagination
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts)/int(params['no_of_posts']))
    page = request.args.get('page')
    if (not str(page).isnumeric()):
        page = 1
    page=int(page)
    posts = posts[(page-1)*int(params['no_of_posts']):(page-1)*int(params['no_of_posts'])+int(params['no_of_posts'])]
    if page==1:
        prev = "#"
        next = "/?page="+ str(page+1)
    elif page==last:
        prev = "/?page="+ str(page-1)
        next = "#"
    else:
        prev = "/?page="+ str(page-1)
        next = "/?page="+ str(page+1)

    
    return render_template('index.html', params=params, posts=posts, prev=prev, next=next)

@app.route('/about')
def about():
    return render_template('about.html', params=params)

@app.route("/uploader" , methods=['GET', 'POST'])
def uploader():
        if "user" in session and session['user']==params['admin_user']:
            if request.method=='POST':
                f = request.files['file1']
                f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
                return "Uploaded successfully!" and redirect('/edit/0')
    


@app.route('/logout')
def logout():
    session.pop('user')
    return redirect('/dashboard')

# @app.route('/login', methods=['GET','POST'])
# def login():
#     return render_template('login.html', params=params)

@app.route("/dashboard", methods=['GET','POST'])
def dashboard():
    if "user" in session and session['user']==params['admin_user']:
        posts = Posts.query.all()
        return render_template("dashboard.html", params=params, posts=posts)

    if request.method=="POST":
        username = request.form.get("uname")
        userpass = request.form.get("upass")
        if username==params['admin_user'] and userpass==params['admin_password']:
            # set the session variable
            session['user']=username
            posts = Posts.query.all()
            return render_template("dashboard.html", params=params, posts=posts)
    else:
        return render_template("login.html", params=params)

@app.route('/post/<string:post_slug>', methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()

    return render_template('post.html', param=params, post=post)

@app.route('/contact',methods = ['GET','POST'])
def contact():
    if request.method=='POST':
        '''Add entry to the database'''
        name = request.form.get('name')
        email = request.form.get('email')
        phone_num = request.form.get('phone')
        msg = request.form.get('message')
        entry=Contacts(name=name,email=email,phone_num=phone_num,msg=msg)
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New message from ' + name,
                          sender=email,
                          recipients = [params['gmail-user']],
                          body = message + "\n" + phone
                          )
    return render_template('contact.html', params=params)


@app.route('/edit/<string:sno>',methods = ['GET','POST'])
def edit(sno):
    if 'user' in session and session['user']==params['admin_user']:
        if request.method=='POST':
            # <!-- Full texts	
            #         sno
            #         title
            #         slug
            #         content
            #         postedby
            #         dateofpost
            #         img_file -->
            title = request.form.get('title')
            slug = request.form.get('slug')
            imgfile = request.form.get('imgfile')
            content = request.form.get('content')
            if sno == '0':
                post = Posts(title=title,slug=slug,img_file=imgfile,content=content,postedby=session['user'],dateofpost=datetime.now())
                db.session.add(post)
                db.session.commit()
                
            else:
                post=Posts.query.filter_by(sno=sno).first()
                post.title=title
                post.slug=slug
                post.img_file=imgfile
                post.content=content
                db.session.commit()
                return redirect('/edit/'+sno)
        post = Posts.query.filter_by(sno=sno).first()        
        return render_template('edit.html', params=params, post=post, sno=sno)


@app.route('/delete/<string:sno>',methods = ['GET','POST'])
def delete(sno):
    if 'user' in session and session['user']==params['admin_user']:
        post = Posts.query.filter_by(sno=sno).first()        
        db.session.delete(post)   
        db.session.commit()                
    return redirect('/dashboard')
        
            
            

if __name__ == "__main__":
    app.run(debug=True, port=8000)