<%@page language="java" import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    // Capturar dados do formulário
    String vlogin = request.getParameter("email");
    String vsenha = request.getParameter("senha");

    if (vlogin == null || vsenha == null) {
        out.print("Erro: email ou senha não enviados.");
        return;
    }

    // Dados para acessar o banco
    String database = "barbearia";
    String endereco = "jdbc:mysql://localhost:3306/" + database;
    String usuario  = "root";
    String senhaBD  = "";

    String driver = "com.mysql.jdbc.Driver";
    Class.forName(driver);

    Connection conexao = DriverManager.getConnection(endereco, usuario, senhaBD);

    String sql = "SELECT * FROM clientes WHERE email = ? AND senha = ?";
    PreparedStatement stm = conexao.prepareStatement(sql);

    stm.setString(1, vlogin);
    stm.setString(2, vsenha);

    ResultSet dados = stm.executeQuery();

    if (dados.next()) {
     
        session.setAttribute("usuario", dados.getString("nome"));

 
        response.sendRedirect("sucessologin.html");
    } else {
        out.print("<h4>Login incorreto</h4>");
        out.print("<a href='index.html'>Voltar</a>");
    }

    stm.close();
    conexao.close();
%>
