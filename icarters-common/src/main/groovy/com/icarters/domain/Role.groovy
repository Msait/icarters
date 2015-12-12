package com.icarters.domain

import org.springframework.security.core.GrantedAuthority

import javax.persistence.*
/**
 * Created by Kostiantyn Bondar.
 */
@Entity
@Table(name = "roles")
@SequenceGenerator(name = "roles_role_id_seq", sequenceName = "roles_role_id_seq", allocationSize = 1)
class Role implements GrantedAuthority {

    @Id @Column(name = "role_id")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "roles_role_id_seq")
    Long id

    @Column(name = "role")
    String role

    @Override
    String getAuthority() {
        return role
    }
}
