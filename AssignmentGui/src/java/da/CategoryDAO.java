package da;

import entity.Category;
import javax.persistence.*;
import java.util.List;

public class CategoryDAO {

    private EntityManagerFactory emf;

    public CategoryDAO() {
        this.emf = Persistence.createEntityManagerFactory("MyPersistenceUnit");
    }

    public List<Category> getAllCategories() {
        EntityManager em = emf.createEntityManager();
        List<Category> categories = null;
        try {
            String jpql = "SELECT c FROM Category c";
            TypedQuery<Category> query = em.createQuery(jpql, Category.class);
            categories = query.getResultList();

            System.out.println("Categories retrieved: " + categories.size());
            for (Category c : categories) {
                System.out.println("Category: " + c.getCategoryname()); // Debug output
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error retrieving categories.");
        } finally {
            em.close();
        }
        return categories;
    }

    public Category getCategoryById(int id) {
        EntityManager em = emf.createEntityManager();
        Category category = em.find(Category.class, id);
        em.close();
        return category;
    }

    public void insertCategory(Category category) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(category);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public void deleteCategory(int id) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            Category category = em.find(Category.class, id);
            if (category != null) {
                em.remove(category);
            }
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public void close() {
        emf.close();
    }
}
