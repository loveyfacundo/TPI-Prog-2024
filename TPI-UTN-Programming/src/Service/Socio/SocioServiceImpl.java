package Service.Socio;

import java.sql.*;
import java.time.LocalDate;
import java.util.Date;
import java.util.Scanner;

public class SocioServiceImpl implements SocioService{
    private Connection connection;
    private Scanner scanner = new Scanner(System.in);

    public SocioServiceImpl(Connection connection) {
        this.connection = connection;
    }
    @Override
    public void agregarSocio() throws SQLException {
        String sql = "INSERT INTO socio (DNI, nombre, apellido, Telefono, MetodoPago, FechaPago, EstadoPago) VALUES (?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement statement = connection.prepareStatement(sql);

        System.out.println("Indique DNI");
        int dni = scanner.nextInt();
        scanner.nextLine();

        System.out.println("Indique el nombre");
        String nombre = scanner.nextLine();

        System.out.println("Indique apellido");
        String apellido = scanner.nextLine();

        System.out.println("Indique telefono");
        String telefono = scanner.nextLine();

        System.out.println("Indique método de pago");
        String metodoPago = scanner.nextLine();


        LocalDate fechaActual = LocalDate.now();

        String estado = "Activo";

        statement.setInt(1, dni);
        statement.setString(2, nombre);
        statement.setString(3, apellido);
        statement.setString(4, telefono);
        statement.setString(5, metodoPago);
        statement.setDate(6, java.sql.Date.valueOf(fechaActual));
        statement.setString(7, estado);

        // Ejecutar la inserción
        int filasAfectadas = statement.executeUpdate();
        System.out.println("Socio agregado correctamente");

    }

    @Override
    public void mostrarSociosInactivos() throws SQLException {

        String sql = "SELECT DNI, nombre, apellido, Telefono, MetodoPago, FechaPago, EstadoPago FROM socio WHERE EstadoPago = 'Inactivo'";

        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {

            while (resultSet.next()) {
                // Mostrar los datos de cada socio inactivo
                int dni = resultSet.getInt("DNI");
                String nombre = resultSet.getString("nombre");
                String apellido = resultSet.getString("apellido");
                String telefono = resultSet.getString("Telefono");
                String metodoPago = resultSet.getString("MetodoPago");
                Date fechaPago = resultSet.getDate("FechaPago");
                String estadoPago = resultSet.getString("EstadoPago");

                System.out.println("DNI: " + dni + ", Nombre: " + nombre + ", Apellido: " + apellido +
                        ", Teléfono: " + telefono + ", Método de pago: " + metodoPago +
                        ", Fecha de pago: " + fechaPago + ", Estado de pago: " + estadoPago);

            }

        }
    }

    @Override
    public void darDeBajaSocioPorDni() {

    }

}
