package com.icarters.domain
import javax.persistence.*
/**
 * Created by Kostiantyn Bondar.
 */
@Entity
@Table(name = "users")
class User {

    @Id @Column(name = "username")
    String username

    @Column(name = "password")
    String password

    @Column(name = "enabled")
    Boolean enabled

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
        name = "users_roles",
        joinColumns = @JoinColumn(name="username", referencedColumnName="username"),
        inverseJoinColumns = @JoinColumn(name="role_id", referencedColumnName="role_id")
    )
    Set<Role> roles;

}
