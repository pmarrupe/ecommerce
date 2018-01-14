package Util;

import Model.User;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import org.apache.catalina.realm.GenericPrincipal;
import org.apache.catalina.realm.RealmBase;

public class MyRealm extends RealmBase {

private String username;

private String password;

User u=null;
String hashc1=null;

@Override
public Principal authenticate(String username, String credentials) {

this.username = username;
this.password = credentials;

try{
hashc1=PasswordUtil.hashPassword(password);
}
catch(Exception e){System.out.println(e);}

u= UserDB.getUser(username);
String pwd= u.getPassword();

/* dummy authentication */
if (hashc1.equals(pwd)) {
    
return getPrincipal(username);

} else {
return null;
}

}

@Override
protected Principal getPrincipal(String username) {
List<String> roles = new ArrayList<String>();

roles.add("customer");
return new GenericPrincipal(username, password, roles);
}

@Override
protected String getPassword(String string) {
return password;
}

@Override
protected String getName() {
return username;
}

/* Custom variables, see <Realm> element */
private String myVariable;

public String getMyVariable() {
return myVariable;
}

public void setMyVariable(String myVariable) {
this.myVariable = myVariable;
}

}
