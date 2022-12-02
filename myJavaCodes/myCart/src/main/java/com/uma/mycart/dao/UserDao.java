
package com.uma.mycart.dao;

import com.uma.mycart.entities.User;
//import javax.persistence.Query;
import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class UserDao {
    private SessionFactory factory;

    public UserDao() {
    }

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public User getUserByEmailandPassword(String email, String password)
    {
        User user=null;
        
        try {
            
            
            String query="from User where userEmail =:e and userPassword =:p ";
            Session session=this.factory.openSession();
            Query q=session.createQuery(query);
            q.setParameter("e",email);
            q.setParameter("p",password);
            
            user=(User) q.uniqueResult();
            
            session.close();
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
      
        return user;
    }
    
    
}
