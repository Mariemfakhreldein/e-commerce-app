package gov.iti.jets.presentation.controllers;

import gov.iti.jets.domain.DomainFacade;
import gov.iti.jets.domain.models.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/products")
public class ProductAdminControllerServlet extends HttpServlet {
    @Override
    protected void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        List<Product> productList = DomainFacade.getProducts();

        var requestDispatcher = request.getRequestDispatcher( "/WEB-INF/views/admin/product/listOfProduct.jsp" );
        request.setAttribute( "listOfProduct", productList );
        requestDispatcher.forward( request, response );
    }
}
