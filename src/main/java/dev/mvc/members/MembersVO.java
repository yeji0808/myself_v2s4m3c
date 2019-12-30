package dev.mvc.members;

public class MembersVO {
  /** 회원번호 */
  private int memberno;
  /** 아이디 */
  private String id="";
  /** 비밀번호 */
  private String passwd="";
  /** 회원이름 */
  private String name="";
  /** 생일 */
  private String birth="";
  /** 전화번호 */
  private String tel="";
  /** 이메일 */
  private String email="";
  /** 우편번호 */
  private String zipcode="";
  /** 주소1 */
  private String address1="";
  /** 주소2 */
  private String address2="";
  /** 유저번호 */
  private int userno;
  /** 가입날짜 */
  private String mdate="";
  
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
  }
  public String getPasswd() {
    return passwd;
  }
  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getBirth() {
    return birth;
  }
  public void setBirth(String birth) {
    this.birth = birth;
  }
  public String getTel() {
    return tel;
  }
  public void setTel(String tel) {
    this.tel = tel;
  }
  public String getEmail() {
    return email;
  }
  public void setEmail(String email) {
    this.email = email;
  }
  public String getZipcode() {
    return zipcode;
  }
  public void setZipcode(String zipcode) {
    this.zipcode = zipcode;
  }
  public String getAddress1() {
    return address1;
  }
  public void setAddress1(String address1) {
    this.address1 = address1;
  }
  public String getAddress2() {
    return address2;
  }
  public void setAddress2(String address2) {
    this.address2 = address2;
  }
  public int getUserno() {
    return userno;
  }
  public void setUserno(int userno) {
    this.userno = userno;
  }
  public String getMdate() {
    return mdate;
  }
  public void setMdate(String mdate) {
    this.mdate = mdate;
  }

}
