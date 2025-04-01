package entity;

public class Admin {

    private int id;
    private String username;
    private String email;
    private String password;
    private int role_Id; // Foreign key reference to Role

    public Admin() {
    }

    public Admin(String email, String username, String password, int role_id) {
        this.email = email;

        this.username = username;
        this.password = password;
        this.role_Id = role_Id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole_Id() {
        return role_Id;
    }

    public void setRoleId(int role_Id) {
        this.role_Id = role_Id;
    }

}
