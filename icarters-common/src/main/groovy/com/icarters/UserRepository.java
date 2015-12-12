package com.icarters;

import com.icarters.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by Kostiantyn Bondar.
 */
@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    User findByUsername(String userName);

}
