// UserController.java
// D. Singletary
// 11/20/25
// Controller for User entity, returns DTOs with task titles

package edu.fscj.cen3024c.taskmanager.controllers;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import edu.fscj.cen3024c.taskmanager.dto.CreateUserRequestDTO;
import edu.fscj.cen3024c.taskmanager.dto.UpdateUserRequestDTO;
import edu.fscj.cen3024c.taskmanager.dto.UserDTO;
import edu.fscj.cen3024c.taskmanager.services.UserService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserService userService;

    // ===== READ endpoints return DTOs =====

    @CrossOrigin(origins = {"http://example.com", "http://localhost"})
    @GetMapping
    public List<UserDTO> getAllUsers() {
        return userService.findAll();
    }

    @GetMapping("/{id}")
    public UserDTO getUserById(@PathVariable Integer id) {
        return userService.findById(id);
    }

    // ===== WRITE endpoints accept DTOs and return DTOs =====

    @PostMapping
    public UserDTO createUser(@Valid @RequestBody CreateUserRequestDTO request) {
        return userService.createUser(request);
    }

    @PutMapping("/{id}")
    public UserDTO updateUser(@PathVariable Integer id, @Valid @RequestBody UpdateUserRequestDTO request) {
        return userService.updateUser(id, request);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteUser(@PathVariable Integer id) {
        userService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}
