<%-- 
    Document   : sample
    Created on : Apr 16, 2016, 11:42:12 PM
    Author     : PRADEEP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form name="form1" action="samples" method="POST"  enctype="multipart/form-data">
            <table border="1">
                <tbody>
                    <tr>
                        <td><input type="text" name="desc" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td><input type="text" name="name" value="" /></td>
                    </tr>
                    <tr>
                        <td><input type="file" name="choosefile" value="" width="100" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="submit" name="submit" /></td>
                    </tr>
                </tbody>
            </table>

        </form>
    </body>
</html>
