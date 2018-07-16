package org.tax.model;

import java.util.Date;

import net.sf.oval.constraint.Email;
import net.sf.oval.constraint.Length;
import net.sf.oval.constraint.MaxLength;
import net.sf.oval.constraint.Min;
import net.sf.oval.constraint.MinLength;
import net.sf.oval.constraint.NotBlank;

public class TaxUser extends TaxUserKey {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tax_user.username
     *
     * @mbg.generated Sat Jul 07 16:56:15 CST 2018
     */
	@MaxLength(20)
	@MinLength(3)
	@NotBlank
    private String username;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tax_user.password
     *
     * @mbg.generated Sat Jul 07 16:56:15 CST 2018
     */
	/**之后前端加入加密后就ok再加回来*/
	//@MaxLength(32)
	//@MinLength(32)
	@NotBlank
    private String password;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tax_user.email
     *
     * @mbg.generated Sat Jul 07 16:56:15 CST 2018
     */
	@Email
    private String email;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tax_user.telephone
     *
     * @mbg.generated Sat Jul 07 16:56:15 CST 2018
     */
	@MaxLength(11)
	@NotBlank
    private String telephone;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tax_user.score
     *
     * @mbg.generated Sat Jul 07 16:56:15 CST 2018
     */
    private Integer score = 0;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tax_user.last_visit
     *
     * @mbg.generated Sat Jul 07 16:56:15 CST 2018
     */
    private Date lastVisit;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tax_user.pro_list
     *
     * @mbg.generated Sat Jul 07 16:56:15 CST 2018
     */
    private String proList;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tax_user.image
     *
     * @mbg.generated Sat Jul 07 16:56:15 CST 2018
     */
    private String image = "default avatar URL";

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tax_user.privilege
     *
     * @mbg.generated Sat Jul 07 16:56:15 CST 2018
     */
    private Byte privilege = 0;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tax_user.username
     *
     * @return the value of tax_user.username
     *
     * @mbg.generated Sat Jul 07 16:56:15 CST 2018
     */
    public String getUsername() {
        return username;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tax_user.username
     *
     * @param username the value for tax_user.username
     *
     * @mbg.generated Sat Jul 07 16:56:15 CST 2018
     */
    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tax_user.password
     *
     * @return the value of tax_user.password
     *
     * @mbg.generated Sat Jul 07 16:56:15 CST 2018
     */
    public String getPassword() {
        return password;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tax_user.password
     *
     * @param password the value for tax_user.password
     *
     * @mbg.generated Sat Jul 07 16:56:15 CST 2018
     */
    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tax_user.email
     *
     * @return the value of tax_user.email
     *
     * @mbg.generated Sat Jul 07 16:56:15 CST 2018
     */
    public String getEmail() {
        return email;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tax_user.email
     *
     * @param email the value for tax_user.email
     *
     * @mbg.generated Sat Jul 07 16:56:15 CST 2018
     */
    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tax_user.telephone
     *
     * @return the value of tax_user.telephone
     *
     * @mbg.generated Sat Jul 07 16:56:15 CST 2018
     */
    public String getTelephone() {
        return telephone;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tax_user.telephone
     *
     * @param telephone the value for tax_user.telephone
     *
     * @mbg.generated Sat Jul 07 16:56:15 CST 2018
     */
    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tax_user.score
     *
     * @return the value of tax_user.score
     *
     * @mbg.generated Sat Jul 07 16:56:15 CST 2018
     */
    public Integer getScore() {
        return score;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tax_user.score
     *
     * @param score the value for tax_user.score
     *
     * @mbg.generated Sat Jul 07 16:56:15 CST 2018
     */
    public void setScore(Integer score) {
        this.score = score;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tax_user.last_visit
     *
     * @return the value of tax_user.last_visit
     *
     * @mbg.generated Sat Jul 07 16:56:15 CST 2018
     */
    public Date getLastVisit() {
        return lastVisit;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tax_user.last_visit
     *
     * @param lastVisit the value for tax_user.last_visit
     *
     * @mbg.generated Sat Jul 07 16:56:15 CST 2018
     */
    public void setLastVisit(Date lastVisit) {
        this.lastVisit = lastVisit;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tax_user.pro_list
     *
     * @return the value of tax_user.pro_list
     *
     * @mbg.generated Sat Jul 07 16:56:15 CST 2018
     */
    public String getProList() {
        return proList;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tax_user.pro_list
     *
     * @param proList the value for tax_user.pro_list
     *
     * @mbg.generated Sat Jul 07 16:56:15 CST 2018
     */
    public void setProList(String proList) {
        this.proList = proList == null ? null : proList.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tax_user.image
     *
     * @return the value of tax_user.image
     *
     * @mbg.generated Sat Jul 07 16:56:15 CST 2018
     */
    public String getImage() {
        return image;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tax_user.image
     *
     * @param image the value for tax_user.image
     *
     * @mbg.generated Sat Jul 07 16:56:15 CST 2018
     */
    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tax_user.privilege
     *
     * @return the value of tax_user.privilege
     *
     * @mbg.generated Sat Jul 07 16:56:15 CST 2018
     */
    public Byte getPrivilege() {
        return privilege;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tax_user.privilege
     *
     * @param privilege the value for tax_user.privilege
     *
     * @mbg.generated Sat Jul 07 16:56:15 CST 2018
     */
    public void setPrivilege(Byte privilege) {
        this.privilege = privilege;
    }
}