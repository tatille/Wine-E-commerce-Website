package Model;

import Model.UserAccount;

public class UserAccount {
    public static final String GENDER_MALE = "M";
    public static final String GENDER_FEMALE = "F";

    private String userName;
    private String gender;
    private String password;

    public UserAccount() {
    }

    public UserAccount(String username, String gender, String password) {
        this.userName = username;
        this.gender = gender;
        this.password = password;
    }

    public UserAccount(String username, String password) {
        this.userName = username;
        this.password = password;
    }

    public UserAccount(UserAccount us) {
        this.userName = us.userName;
        this.gender = us.gender;
        this.password = us.password;
    }

    public String getUserName() {
        return userName;
    }

    public String getGender() {
        return gender;
    }

    public String getPassword() {
        return password;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
