from flask import Flask,render_template,request
from flask_mysqldb import MySQL
from flask_mail import Mail,Message
import datetime


app = Flask(__name__)

# Configure db
app.config['MYSQL_HOST'] = "localhost"
app.config['MYSQL_USER'] = "root"
app.config['MYSQL_PASSWORD'] = ""
app.config['MYSQL_DB'] = "jonah"

mysql = MySQL(app)

   
@app.route("/")

def home():
    return render_template("home.html")

@app.route("/Registerdonor", methods=["POST","GET"])

def Registerdonor():
    if request.method == 'POST':
        doby =  request.form.get('date').split("-")[0]
        year = datetime.datetime.now().year
        age  =  year - int(doby)
        if age > 18:
            try:
                fname = request.form.get('fname')
                sname = request.form.get('sname')
                password = request.form.get('password')
                email = request.form.get('email')
                date =  request.form.get('date')
                gender = request.form.get('gender')
                bloodgroup = request.form.get('bloodgroup')
                cur = mysql.connection.cursor()
                cur.execute("INSERT INTO pd     (fname,sname,password,email,date,gender,Blood_group) VALUES ('{}','{}','{}','{}','{}','{}','{}')".format(fname,sname,password,email,date,gender,bloodgroup))
                mysql.connection.commit()
                cur.close()
                return render_template("home.html")
            except:
                return render_template("registerdonor.html", message= "Mail ID is Alredy Registered try Logging in")
                    
        else:
            return render_template("home.html", message= "sorry you cann't donate plasma")
    return render_template("registerdonor.html")

@app.route("/RR",methods=["POST","GET"])

def RR():
    if request.method == "POST":
        try:
                fname = request.form.get('fname')
                sname = request.form.get('sname')
                password = request.form.get('password')
                email = request.form.get('email')
                gender = request.form.get('gender')
                hospital_name = request.form.get('hospital_name')
                
                cur = mysql.connection.cursor()
                cur.execute("INSERT INTO pr(fname,sname,password,email,gender,hospital_name) VALUES ('{}','{}','{}','{}','{}','{}')".format(fname,sname,password,email,gender,hospital_name))
                mysql.connection.commit()
                cur.close()
                return render_template("home.html")
        except:
                return render_template("rr.html", message= "Mail ID is Alredy Registered try Logging in")
    return render_template("rr.html")


@app.route("/LR",methods=["POST","GET"])

def LR():
    message = ""
    if request.method == "POST" and "email" in request.form and "password" in request.form:
        email = request.form.get("email")
        password = request.form.get("password")
        cur = mysql.connection.cursor()
        cur.execute("select * from pr where email = '{}' and password = '{}';".format(email,password))
        user = cur.fetchone()
        if user:
            cur.execute("select * from pd")
            info = cur.fetchall()
            cur.execute("select count(*) from pd")
            count = cur.fetchone()
            count = count[0]
            return render_template("status.html" ,info=info , count=count)
        else:
            message = "please type correct email or password "
            return render_template("lr.html", message=message)
    return render_template("lr.html")



@app.route("/Logindonor", methods=["POST","GET"])

def Logindonor():
    message = ""
    if request.method == "POST" and "email" in request.form and "password" in request.form:
        email = request.form.get("email")
        password = request.form.get("password")
        cur = mysql.connection.cursor()
        cur.execute("select * from pd where email = '{}' and password = '{}';".format(email,password))
        user = cur.fetchone()
        if user:
            email = user[2]
            return render_template("home.html", email = email)
        else:
            message = "please type correct email or password "
            
            return render_template("logindonor.html", message=message)
    return render_template("logindonor.html", message=message)
    


if __name__ == "__main__":
    app.run(debug=True)



