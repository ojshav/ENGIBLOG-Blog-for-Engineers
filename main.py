from flask import Flask, render_template, request, session , redirect
import requests
import json
import os
from flask_ckeditor import CKEditorField
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import smtplib
from werkzeug.utils import secure_filename
import math

OWN_EMAIL = "ojshavsaxenaa@gmail.com"
Email_password = "amrrbbmsmhaldppk"
blog_url = "https://api.npoint.io/a79cef70bd1165a8682f"
blog_response = requests.get(blog_url)
posts = blog_response.json()
local_server = True

with open("config.json", "r") as c:
    params = json.load(c)["params"]
app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['UPLOAD_FOLDER'] = params['upload_location']
if (local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = params["local_uri"]
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params["prod_uri"]
db = SQLAlchemy(app)


class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String, nullable=False)
    sub_heading = db.Column(db.String, nullable=False)
    slug = db.Column(db.String)
    content = db.Column(db.String)
    img_file = db.Column(db.String, nullable=True)
    author = db.Column(db.String, nullable=True)
    date = db.Column(db.String, nullable=True)


class Contaactpage(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, nullable=False)
    email = db.Column(db.String)
    phoneno = db.Column(db.Integer)
    message = db.Column(db.String)
    date = db.Column(db.String, nullable=True)



@app.route("/dashboard", methods = ['GET', 'POST'])
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
            return render_template("signup.html", params=params)
    else:
        return render_template("signup.html", params=params)
@app.route('/')
def home():
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts)/int(params['no_of_posts']))
    page = request.args.get('page')
    if (not str(page).isnumeric()):
        page = 1
    page = int(page)
    posts = posts[(page-1)*int(params['no_of_posts']):(page-1)*int(params['no_of_posts'])+ int(params['no_of_posts'])]
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
@app.route('/edit/<string:sno>', methods = ['GET', 'POST'])
def edit(sno):
    if "user" in session and session['user']==params['admin_user']:
        if request.method == 'POST':
            box_title = request.form.get('title')
            sub_heading = request.form.get('Sub_heading')
            slug = request.form.get('slug')
            content = request.form.get('content')
            author = request.form.get('author')
            date = datetime.now()

            if sno == '0':
                post = Posts(title = box_title, slug = slug, content = content,sub_heading = sub_heading,author = author,date = date)
                db.session.add(post)
                db.session.commit()
            else:
                post = Posts.query.filter_by(sno = sno).first()
                post.title = box_title
                post.slug  =slug
                post.content = content
                post.sub_heading = sub_heading
                post.author = author
                post.date = date
                db.session.commit()
                return redirect('/edit' + sno)
        post = Posts.query.filter_by(sno= sno).first()

        
        return render_template('edit.html',params = params,post = post,sno= sno)
    return render_template('edit.html',params = params,post = post,sno= sno)
    
@app.route('/delete/<string:sno>', methods = ['GET', 'POST'])
def delete(sno):
    if "user" in session and session['user']==params['admin_user']:
       post = Posts.query.filter_by(sno=sno).first()
       db.session.delete(post)
       db.session.commit()
    return redirect('/dashboard')

@app.route('/uploader', methods = ['GET','POST'])
def uploader():
    if "user" in session and session['user']==params['admin_user']:
        if(request.method == 'POST'):
            f = request.files['myfile']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
            return "uploaded successfully"

@app.route("/post/<string:post_slug>", methods=["GET", "POST"])
def show_post(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()

    return render_template("post.html", post=post, params=params)



@app.route('/about.html')
def about():
    return render_template("about.html", params=params)


def send_email(name, email, phone, message):
    email_message = f"Subject:New Message\n\nName: {name}\nEmail: {email}\nPhone: {phone}\nMessage:{message}"
    with smtplib.SMTP("smtp.gmail.com") as connection:
        connection.starttls()
        connection.login(OWN_EMAIL, Email_password)
        connection.sendmail(OWN_EMAIL, OWN_EMAIL, email_message)

@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/dashboard')


@app.route("/contact.html", methods=["GET", "POST"])
def contact():
    if request.method == "POST":
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')

        entry = Contaactpage(name=name, phoneno=phone, message=message, email=email, date=datetime.now())
        db.session.add(entry)
        db.session.commit()
        data = request.form
        send_email(data["name"], data["email"], data["phone"], data["message"])
        return render_template("contact.html", params=params, msg_sent=True)

    return render_template("contact.html", params=params, msg_sent=False)


if __name__ == "__main__":
    app.run(debug=True)
