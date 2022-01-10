package com.kh.khis.Interview_review_board.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
public class BoardComment implements Serializable {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	private int commentNo;
	private int boardNo;
	private int writerNo;
	private String writerName;
	private String commentSecretYN;
	private String commentDate;
	private String commentContent;
}
