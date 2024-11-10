package Service.Socio;

import java.sql.SQLException;

public interface SocioService {
    void agregarSocio() throws SQLException;
    void mostrarSociosInactivos() throws SQLException;
    void darDeBajaSocioPorDni();
}
