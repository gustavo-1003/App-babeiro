<%@page language="java" import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%

    //Variavel para armazenar os dados que o usuario digitou
    String vlogin = request.getParameter("email");
    String vsenha = request.getParameter("senha");

    //Variaveis para acessar o banco de dados
    String database = "barbearia" ;
    String endereco = "jdbc:mysql://localhost:3306/" + database ;
    String usuario  = "root" ;
    String senha    = "" ;

    //Driver
    String driver   = "com.mysql.jdbc.Driver" ;

    //Carregar o Driver na memoria
    Class.forName( driver ) ;

    //Cria a variavel para conectar com o banco
    Connection conexao ;

    //Abrir a conexao com o banco de dados
    conexao = DriverManager.getConnection(endereco,usuario,senha) ;

    String sql = "SELECT * FROM clientes WHERE email=? AND senha=?";

    PreparedStatement stm = conexao.prepareStatement( sql ) ;
    stm.setString( 1 , vlogin ) ;
    stm.setString( 2 , vsenha ) ;

    ResultSet dados = stm.executeQuery() ;

    if ( dados.next() ) {
 
        session.setAttribute("clientes" , dados.getString("nome") ) ;
        response.sendRedirect("grava.jsp") ;
    } else {
     
        out.print("<h4>Login incorreto</h4>") ;
        out.print("<a href='index.html'>Voltar</a>") ;
    }

%>