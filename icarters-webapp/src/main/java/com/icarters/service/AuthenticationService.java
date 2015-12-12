package com.icarters.service;


import com.icarters.UserRepository;
import com.icarters.domain.Role;
import com.icarters.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Set;

/**
 * Created by Kostiantyn Bondar.
 */
@Service
public class AuthenticationService implements UserDetailsService {

    private UserRepository userRepository;

    @Autowired
    public AuthenticationService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        final User user = userRepository.findByUsername(username);
        final Set<Role> roles = user.getRoles();

        final org.springframework.security.core.userdetails.User userDetails
                = new org.springframework.security.core.userdetails.User(
                    user.getUsername(), user.getPassword(), roles);

        return userDetails;
    }

}
