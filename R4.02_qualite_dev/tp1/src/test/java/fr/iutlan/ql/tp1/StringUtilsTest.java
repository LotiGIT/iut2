package fr.iutlan.ql.tp1;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class StringUtilsTest {

	@Test
	void lengthBetweenOnAllEmptyMustReturn0() {
	    // ARRANGE

	    // ACT
	    int result = StringUtils.lengthBetween("", "", "");

	    // ASSERT
	    assertEquals(0, result);
	}

	@Test
	void lengthBetweenOnAllOk() {
	    // ARRANGE

	    // ACT
	    int result = StringUtils.lengthBetween("BonjOur tOut Le mOndE", "jOur", "mOn");

	    // ASSERT
	    assertEquals(9, result);
	}

	@Test
	void lengthBetweenOnMissingBegMustReturnM1() {
	    // ARRANGE

	    // ACT
	    int result = StringUtils.lengthBetween("BonjOur tOut Le mOndE", "JOUR", "mOn");

	    // ASSERT
	    assertEquals(-1, result);
	}
	
	@Test
	void lengthBetweenOnBegAndEndNullMustReturnM1() {
	    // ARRANGE

	    // ACT
	    int result = StringUtils.lengthBetween(" ", "null", "null");

	    // ASSERT
	    assertEquals(-1, result);
	}
	
	@Test
	void lengthBetweenBonjourAndMondeEmptyMustReturnM1() {
		// ARRANGE
		
		
		// ACT
		int result = StringUtils.lengthBetween("Bonjour tout le monde", "null", "null");
		
		// ASSERT
		assertEquals(-1, result);
	}
	
	@Test 
	void lengthBetweenBegAndEndMustReturn13(){
		// ARRANGE
		
		
		// ACT
		int result = StringUtils.lengthBetween("Bonjour tout le monde", "Bon", "monde");
		
		// ASSERT
		assertEquals(13, result);
		
		
	}
	
	@Test 
	void lengthFromBegMustReturn22(){
		// ARRANGE
		
		
		// ACT
		int result = StringUtils.lengthBetween("Bonjour, Bonjour tout le monde", "Bon", "monde");
		
		// ASSERT
		assertEquals(22, result);
		
		
	}
	
	@Test 
	void lengthFromEndMustReturn20(){
		// ARRANGE
		
		
		// ACT
		int result = StringUtils.lengthBetween("Bonjour tout le monde, monde", "Bon", "monde");
		
		// ASSERT
		assertEquals(20, result);
		
		
	}
	
	@Test 
	void lengthFromEndToEndMustReturn2(){
		// ARRANGE
		
		
		// ACT
		int result = StringUtils.lengthBetween("Bonjour tout le monde, monde", "monde", "monde");
		
		// ASSERT
		assertEquals(2, result);
		
		
	}
	
	@Test
	void method2OnNullMustThrowNullPointerException() {
	    // ARRANGE
	    CLASSE obj = new CLASSE();

	    // ASSERT
	    assertThrows(NullPointerException.class, () -> {

	        // ACT
	        obj.method2(null);
	    });
	}
}
