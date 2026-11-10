// User.java
// D. Singletary
// 9/10/25
// User entity for task manager application

package edu.fscj.cen3024c.taskmanager.entities;

import jakarta.persistence.*;
import java.util.Set;

@Entity
@Table(name = "users") // Avoid 'user' in PostgreSQL
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false, unique = true)
    private String username;

    @Column(name = "salt", nullable = false)
    private String salt;

    @Column(name = "password_hash", nullable = false)
    private String passwordHash;

    @ManyToMany(mappedBy = "users")
    private Set<Task> tasks;

    // Constructors
    public User() {}

    public User(String username, String salt, String passwordHash) {
        this.username = username;
        this.salt = salt;
        this.passwordHash = passwordHash;
    }

    // Getters and setters
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    public Set<Task> getTasks() {
        return tasks;
    }

    public void setTasks(Set<Task> tasks) {
        this.tasks = tasks;
    }
}