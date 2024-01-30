package SOAS.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Accountant {
    private int id;
    private String username;
    private String password;
    private String role;
}
