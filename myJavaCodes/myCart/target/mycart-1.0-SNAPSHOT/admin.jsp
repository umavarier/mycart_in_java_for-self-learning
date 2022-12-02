<%@page import="com.uma.mycart.entities.User" %>
<%@page import ="com.uma.mycart.entities.Category"%>
<%@page import ="com.uma.mycart.dao.CategoryDao"%>
<%@page import ="com.uma.mycart.helper.FactoryProvider"%>
<%@page import ="org.hibernate.Session"%>
<%@page import ="java.util.List"%>
<% User user =(User) session.getAttribute("current-user");
    if(user==null)
    {
        session.setAttribute("message","You are not logged in !! Login first !");
        response.sendRedirect("login.jsp");
        return;
    }
    else
    {
        if(user.getUserType().equals("Normal"))
        {
            session.setAttribute("message","Access denied !! You are not a Admin ");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        
        <%@include file="components/navbar.jsp" %>
        
        <div class="container admin">
            
            
            <div class="container-fluid mt-3">
                
                <%@include file="components/message.jsp" %>
                
            </div>
            
            
            
            <div class="row mt-3">
                
                
                
            
            <!-- First col-->
            <div class="col-md-4">
                <div class="card">
                <div class="card-body text-center">
                    <div class="container">
                        <img style="max-width: 120px;" class="img-fluid rounded-circle" src="img/user1.png" alt="user_icon">
                    </div>
                    <h1>2345</h1>
                    <h1 class="text-uppercase text-muted">Users</h1>
                    
                    
                </div>
                </div> 
                
            </div>
            
            <!--second col-->
            <div class="col-md-4">
                <div class="card">
                <div class="card-body text-center">
                     <div class="container">
                        <img style="max-width: 120px;" class="img-fluid rounded-circle" src="img/list.png" alt="category_icon">
                    </div>
                    <h1>2345</h1>
                    <h1 class="text-uppercase text-muted">Categories</h1>
                
                
                </div></div></div>
            <!--third col-->
            <div class="col-md-4">
                <div class="card">
                <div class="card-body text-center">
                    
                     <div class="container">
                        <img style="max-width: 120px;" class="img-fluid rounded-circle" src="img/cubes.png" alt="product_icon">
                    </div>
                    <h1>2343</h1>
                    <h1 class="text-uppercase text-muted">Products</h1>
                
                
            </div>
            
            </div>
            </div>
        </div>
            
            <!-- second row -->

            <div class="row mt-3">
                
                <!<!-- second row -first col -->
                <div class="col-md-6">
                <div class="card" data-toggle="modal" data-target="#add-category-modal">
                <div class="card-body text-center">
                    <div class="container">
                        <img style="max-width: 120px;" class="img-fluid rounded-circle" src="img/key.png" alt="user_icon">
                    </div>
                    <p>Click here to add new Category</p>
                    <h1 class="text-uppercase text-muted">Add Category</h1>
                    
                    
                </div>
                </div>     
                </div>
                
                <!-- second row-second col-->
                <div class="col-md-6">
                   <div class="card" data-toggle="modal" data-target="#add-product-modal">
                    <div class="card-body text-center">
                    <div class="container">
                        <img style="max-width: 120px;" class="img-fluid rounded-circle" src="img/packaging.png" alt="user_icon">
                    </div>
                        <p>Click here to add new Products</p>
                    <h1 class="text-uppercase text-muted">Add Products</h1>
                    
                    
                </div>
                </div>  
                  
                    
                    
                </div>
                
                
                
                
            </div>
            
        
        </div> 
                
        
        <!-- add category Modal -->

            <!-- Modal -->

    <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header bg-warning text-black">
                    <h5 class="modal-title" id="exampleModalLabel">fill up category details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="ProductOperationServlet" method="post">
                        
                        <input type="hidden" name="operation" value="addcategory">
                     
                        <div class="form-group">
                            <input type="text" class="form-control" name="catTitle" placeholder="Enter Category title" required/>
                        </div>
                        
                        <div class="form-group">
                            <textarea style="height: 300px;" class="form-control" name="catDescription" placeholder="Enter Category description" required/></textarea>
                        </div>
                        
                        <div class="container text-center">
                            <button class="btn btn-outline-success">Add Category</button>    
                            <button type="button" class="btn btn-outline-warning" data-dismiss="modal">Close</button>
                        </div>
                        
                        
                        
                    </form>
                </div>
                <div class="modal-footer">
                    
                    
                </div>
            </div>
        </div>
    </div>

<!-- End of Add category modal -->



<!-- Productt modal -->

<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header bg-warning text-black">
                    <h5 class="modal-title" id="exampleModalLabel">fill up product details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="operation" value="addproduct"/>
                        <div class="form-group">
                            <input type="text" class="form-control" name="pName" placeholder="Enter product name" required/>
                        </div>
                        <div class="form-group">
                            <textarea style="height: 200px;" class="form-control" name="pDesc" placeholder="Enter Product description" required/></textarea>
                        </div>
                        
                        <div class="form-group">
                            <input type="number" class="form-control" name="pPrice" placeholder="Enter product price" required/>
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control" name="pDiscount" placeholder="Enter product discount" >
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control" name="pQuantity" placeholder="Enter product quantity" >
                        </div>
                        
                        
                        <!-- Product category -->
                        
                        
                        <%
                            
                          CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());  
                          List<Category> list=cdao.getCategories(); 
                            
                        %>    
                        
                        <div class="form-group">
                              <select class="form-control" name="catId" id="catId">
                                
                                
                                <%
                                                 
                                 for(Category c:list)
                                 {
 
                                %>    
                                <option value="<%= c.getCategoryId() %>"><%= c.getCategoryTitle() %></option>
                                 <%
                                     }
                                 %>
                            </select>     
                        </div>
                            
                            <!-- submit button -->
                            
                            
                        <div class="form-group">
                            <label for="pPic">Add Product image</label>
                            <input type="file" id="pPic" name="pPic" required/>
                        </div>

                        
                        
                        <div class="container text-center">
                            <button class="btn btn-outline-success">Add Product</button>    
                            <button type="button" class="btn btn-outline-warning" data-dismiss="modal">Close</button>
                        </div>
                                        
                     </form>   
                        
                    
                </div>
                
            </div>
        </div>
    </div>

<!-- End of Add product model -->


    </body>
</html>
