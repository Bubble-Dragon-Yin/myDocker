package SOAS.pojo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RegEvent {
    private int id;
    private String title;
    private String type;
    private String content;
    private int userId;
    private String userUsername;
    private String userName;
    private String userPassword;
    private Integer familyMembers;
    private String proofImage;
    private String sport;
    private String party;
    private String skill;
    private Double eleQuantity;
    private Integer regMonth;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate createDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate updateDate;
}
