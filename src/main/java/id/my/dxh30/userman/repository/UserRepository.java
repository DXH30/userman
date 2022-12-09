package id.my.dxh30.userman.repository;
import org.springframework.data.repository.CrudRepository;

import id.my.dxh30.userman.dto.User;

public interface UserRepository extends CrudRepository<User, Integer> {

}
