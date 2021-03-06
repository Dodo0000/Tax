package org.tax.model;

import java.util.Date;

import lombok.Data;
@Data
public class TaxExpert extends TaxExpertKey {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tax_expert.author_id
     *
     * @mbg.generated Sat Jul 07 16:10:25 CST 2018
     */
    private String authorId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tax_expert.title
     *
     * @mbg.generated Sat Jul 07 16:10:25 CST 2018
     */
    private String title;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tax_expert.content
     *
     * @mbg.generated Sat Jul 07 16:10:25 CST 2018
     */
    private String content;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tax_expert.publish_date
     *
     * @mbg.generated Sat Jul 07 16:10:25 CST 2018
     */
    private Date publishDate;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tax_expert.click
     *
     * @mbg.generated Sat Jul 07 16:10:25 CST 2018
     */
    private Integer click;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tax_expert.likes
     *
     * @mbg.generated Sat Jul 07 16:10:25 CST 2018
     */
    private Integer likes;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tax_expert.favourite
     *
     * @mbg.generated Sat Jul 07 16:10:25 CST 2018
     */
    private Integer favourite;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tax_expert.author_id
     *
     * @return the value of tax_expert.author_id
     *
     * @mbg.generated Sat Jul 07 16:10:25 CST 2018
     */
    public String getAuthorId() {
        return authorId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tax_expert.author_id
     *
     * @param authorId the value for tax_expert.author_id
     *
     * @mbg.generated Sat Jul 07 16:10:25 CST 2018
     */
    public void setAuthorId(String authorId) {
        this.authorId = authorId == null ? null : authorId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tax_expert.title
     *
     * @return the value of tax_expert.title
     *
     * @mbg.generated Sat Jul 07 16:10:25 CST 2018
     */
    public String getTitle() {
        return title;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tax_expert.title
     *
     * @param title the value for tax_expert.title
     *
     * @mbg.generated Sat Jul 07 16:10:25 CST 2018
     */
    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tax_expert.content
     *
     * @return the value of tax_expert.content
     *
     * @mbg.generated Sat Jul 07 16:10:25 CST 2018
     */
    public String getContent() {
        return content;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tax_expert.content
     *
     * @param content the value for tax_expert.content
     *
     * @mbg.generated Sat Jul 07 16:10:25 CST 2018
     */
    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tax_expert.publish_date
     *
     * @return the value of tax_expert.publish_date
     *
     * @mbg.generated Sat Jul 07 16:10:25 CST 2018
     */
    public Date getPublishDate() {
        return publishDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tax_expert.publish_date
     *
     * @param publishDate the value for tax_expert.publish_date
     *
     * @mbg.generated Sat Jul 07 16:10:25 CST 2018
     */
    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tax_expert.click
     *
     * @return the value of tax_expert.click
     *
     * @mbg.generated Sat Jul 07 16:10:25 CST 2018
     */
    public Integer getClick() {
        return click;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tax_expert.click
     *
     * @param click the value for tax_expert.click
     *
     * @mbg.generated Sat Jul 07 16:10:25 CST 2018
     */
    public void setClick(Integer click) {
        this.click = click;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tax_expert.likes
     *
     * @return the value of tax_expert.likes
     *
     * @mbg.generated Sat Jul 07 16:10:25 CST 2018
     */
    public Integer getLikes() {
        return likes;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tax_expert.likes
     *
     * @param likes the value for tax_expert.likes
     *
     * @mbg.generated Sat Jul 07 16:10:25 CST 2018
     */
    public void setLikes(Integer likes) {
        this.likes = likes;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tax_expert.favourite
     *
     * @return the value of tax_expert.favourite
     *
     * @mbg.generated Sat Jul 07 16:10:25 CST 2018
     */
    public Integer getFavourite() {
        return favourite;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tax_expert.favourite
     *
     * @param favourite the value for tax_expert.favourite
     *
     * @mbg.generated Sat Jul 07 16:10:25 CST 2018
     */
    public void setFavourite(Integer favourite) {
        this.favourite = favourite;
    }
}