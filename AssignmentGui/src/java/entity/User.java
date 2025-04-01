package entity;

public class User {

    private int id;
    private String email;
    private String username;
    private String password;
    private int role_id;
    private String phone;

    public User() {
    }

    public User(int id, String email, String username, String password, int role_id, String phone) {
        this.id = id;
        this.email = email;
        this.username = username;
        this.password = password;
        this.role_id = role_id;
        this.phone = phone;  // Initialize phone number
    }

    public User( String email, String username, String password, int role_id, String phone) {
       
        this.email = email;
        this.username = username;
        this.password = password;
        this.role_id = role_id;
        this.phone = phone; 
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole_ID() {
        return role_id;
    }

    public void setRole_Id(int role_id) {
        this.role_id = role_id;
    }

    public String getPhone() {  // New getter for phone
        return phone;
    }

    public void setPhone(String phone) {  // New setter for phone
        this.phone = phone;
    }
}
