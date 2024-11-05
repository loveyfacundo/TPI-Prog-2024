public class cliente {
    private int dni;
    private String apellido;
    private String nombres;
    private static int plan;
//El tema de plan lo asumí que va a ser como si fuese la id de los diferentes tipos de planes que pueda haber
    //Constructor
    public cliente(int dni, String apellido, String nombres, int plan) {
        this.dni = dni;
        this.apellido = apellido;
        this.nombres = nombres;
        this.plan = plan;
    }

    //Getters and Setters

    public int getDni() {
        return dni;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public int getPlan() {
        return plan;
    }

    public void setPlan(int plan) {
        this.plan = plan;
    }

    //Methods
    public static void marcarAsistencia(int dni){
        //Faltaría ver como asociar el dni con la persona para registrar la asistencia
        int asistencia = 3;
        switch (plan){
            case 1 ->{ //plan de 3 días de gym por semana
                if (asistencia >= 1){
                    System.out.println("Asistencia Registrada con Éxito.");
                    asistencia = asistencia - 1;
                } else {
                    System.out.println("Ya has usado todas las asistencia por semana que tiene su plan. Mejórelo y podrá asistir todos los días de la semana");
                }
            }
            case 2 -> {
                System.out.println("Asistencia Registrada con Éxito");
            }
            default -> {
                System.out.println("Plan Desconocido. Hable con un Empleado");
            }
        }
    }
}
