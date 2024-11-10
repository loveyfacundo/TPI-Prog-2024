import Service.Empleado.EmpleadoServiceImpl;
import Service.Socio.SocioService;
import Service.Socio.SocioServiceImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class App {

    public static void main(String[] args) throws SQLException {
        Scanner scanner = new Scanner(System.in);

        DatabaseConnection databaseConnection = new DatabaseConnection();
        Connection connection = databaseConnection.getConnection();
        EmpleadoServiceImpl empleadoService = new EmpleadoServiceImpl(connection);
        SocioService socioService = new SocioServiceImpl(connection);

        System.out.println("¿Qué quiere hacer?");
        System.out.println("1. Agregar empleado");
        System.out.println("2. Modificar empleado por ID");
        System.out.println("3. Eliminar empleado por ID");
        System.out.println("4. Ver todos los empleados ");

        System.out.println("5. Agregar socio");
        System.out.println("6. Modificar información de socio por ID");
        System.out.println("7. Revisar faltas del socio por ID");
        System.out.println("8. Ver estado del socio por ID");

        System.out.println("9. Modificar membresia de socio");

        System.out.println("Indique lo que quiere hacer:");
        int opcion = scanner.nextInt();
        scanner.nextLine();

        switch (opcion) {
            case 1:
                empleadoService.agregarEmpleado();
                break;

            case 2:
                empleadoService.modificarEmpleadoPorDni();
                break;

            case 3:
                empleadoService.eliminarEmpleadoPorDni();
                break;

            case 4:
                empleadoService.mostrarTodosLosEmpleados();
                break;

            case 5:
                socioService.agregarSocio();
                break;

            case 6:
                socioService.mostrarSociosInactivos();
                break;

            case 7:
                //Revisar faltas del socio por ID
                break;

            case 8:
                //Ver estado del socio por ID
                break;

            case 9:
                //Modificar membresia de socio
                break;
        }

    }
}