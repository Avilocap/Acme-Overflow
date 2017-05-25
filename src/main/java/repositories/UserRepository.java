package repositories;

import domain.Mezzage;
import domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Collection;

/**
 * Created by daviddelatorre on 15/5/17.
 */
public interface UserRepository extends JpaRepository<User, Integer> {

    @Query("select c from User c where c.userAccount.id = ?1")
    User findByUserAccountId(int userAccountId);


    @Query("select m from User u join u.webinars w join w.webiMezzages m where u=?1")
    Collection<Mezzage> myWebbinarMezzages(User u);


}
