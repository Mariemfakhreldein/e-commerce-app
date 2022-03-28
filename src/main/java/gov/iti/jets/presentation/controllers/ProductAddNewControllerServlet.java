package gov.iti.jets.presentation.controllers;

import gov.iti.jets.domain.DomainFacade;
import gov.iti.jets.domain.enums.Category;
import gov.iti.jets.domain.models.Product;
import gov.iti.jets.presentation.viewhelpers.ProductAddNewViewHelper;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.util.UUID;

@MultipartConfig
@WebServlet( "/admin/products/add" )
public class ProductAddNewControllerServlet extends HttpServlet {
    ProductAddNewViewHelper productAddNewViewHelper = new ProductAddNewViewHelper();

    @Override
    protected void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        productAddNewViewHelper.setFailedToAddProduct( false );
        productAddNewViewHelper.setSuccessfullyAddedProduct( false );
        RequestDispatcher requestDispatcher = request.getRequestDispatcher( "/WEB-INF/views/admin/product/addProduct.jsp" );
        request.setAttribute( "helper", productAddNewViewHelper );
        requestDispatcher.forward( request, response );
    }

    @Override
    protected void doPost( HttpServletRequest req, HttpServletResponse resp ) throws ServletException, IOException {
        productAddNewViewHelper.setFailedToAddProduct( false );
        productAddNewViewHelper.setSuccessfullyAddedProduct( false );
        RequestDispatcher requestDispatcher = req.getRequestDispatcher( "/WEB-INF/views/admin/product/addProduct.jsp" );
        req.setAttribute( "helper", productAddNewViewHelper );

        String name = req.getParameter( "name" );
        String description = req.getParameter( "description" );
        int quantity = Integer.parseInt( req.getParameter( "quantity" ) );
        int price = Integer.parseInt( req.getParameter( "price" ) ) * 100;

        Category category = Category.valueOf( req.getParameter( "category" ) );

        Part photo = req.getPart( "productPhoto" );
        String photoName = getFileName( photo );
        if ( photoName != null && !photoName.isEmpty() ) {
            String[] split = photoName.split( "\\." );
            photoName = UUID.randomUUID().toString().replace( "-", "" ) + "." + split[1];
        }

        Product product = new Product( name, description, photoName, price, quantity, category );
        try {
            DomainFacade.addProduct( product );
            if ( photoName != null && !photoName.isEmpty() ) {
                photo.write( "C:/ecommerce/" + photoName );
            }
            productAddNewViewHelper.setSuccessfullyAddedProduct( true );
        } catch ( RuntimeException e ) {
            productAddNewViewHelper.setFailedToAddProduct( true );
        } finally {
            requestDispatcher.forward( req, resp );
        }
    }

    public String getFileName( Part photo ) {
        for ( String content : photo.getHeader( "content-disposition" ).split( ";" ) ) {
            if ( content.trim().startsWith( "filename" ) ) {
                return content.substring( content.indexOf( "=" ) + 1 ).trim().replace( "\"", "" );
            }
        }
        return null;
    }
}
