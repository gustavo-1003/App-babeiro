<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>

<%
    String vdata = request.getParameter("data");
    String vhorario = request.getParameter("horario");
    int vid = Integer.parseInt(request.getParameter("id_clientes"));

    String database = "barbearia";
    String endereco = "jdbc:mysql://localhost:3306/" + database;
    String usuario = "root";
    String senha = "";

    Class.forName("com.mysql.jdbc.Driver");
    Connection conexao = DriverManager.getConnection(endereco, usuario, senha);

    String sql = "INSERT INTO agenda (data, horario, id_clientes) VALUES (?, ?, ?)";
    PreparedStatement stm = conexao.prepareStatement(sql);

    stm.setString(1, vdata);
    stm.setString(2, vhorario);
    stm.setInt(3, vid);

    stm.execute();
    stm.close();
    conexao.close();

    response.sendRedirect("confirmacao.html");
%>
