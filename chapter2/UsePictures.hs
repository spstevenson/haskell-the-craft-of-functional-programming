--	##################################################################
--
--	UsePictures.hs
--	
--	Sion Stevenson
--	
--	January 2015
--	
--	An implementation of UsePictures as defined in Haskell The Craft
--	of Functional Programming exercises 2.1 to 2.5
--	
--	####################################################################

module UsePictures where
import Pictures

-- Functions for exercise 2.1

-- Take the horse from Pictures and invert the colours

blackHorse :: Picture
blackHorse = invertColour horse

-- Rotate is already defined in Pictures so I think this task must
-- be an error of some kind

-- get the horse and rotate it directly in this

rotateHorse :: Picture
rotateHorse = rotate horse

-- For exercise 2.2 we could define a black rectangle by superimposing
-- a horse against a black horse

black :: Picture
black = superimpose horse blackHorse

-- For exercise 2.3 two different ways of achieving the picture are as follows

checkerBoardTwoByTwo :: Picture
checkerBoardTwoByTwo = above (sideBySide white black) (sideBySide black white)

checkerBoardTwoByTwoMethod2 :: Picture
checkerBoardTwoByTwoMethod2 = sideBySide (above white black) (above black white)

-- From these 2 by 2 potions we can make 4 by 4 and finally 8 by 8

checkerBoardFourByFour :: Picture
checkerBoardFourByFour = above (sideBySide checkerBoardTwoByTwo checkerBoardTwoByTwo) (sideBySide checkerBoardTwoByTwo checkerBoardTwoByTwo)

checkerBoardEightByEight :: Picture
checkerBoardEightByEight = above (sideBySide checkerBoardFourByFour checkerBoardFourByFour) (sideBySide checkerBoardFourByFour checkerBoardFourByFour)

-- Exercise 2.4 Producing the three variants of the horse pictures

variant1 :: Picture
variant1 = above (sideBySide horse blackHorse) (sideBySide blackHorse horse)

variant2 :: Picture
variant2 = above (sideBySide horse blackHorse) (sideBySide (flipV blackHorse) (flipV horse))

variant3 :: Picture
variant3 = above (sideBySide horse blackHorse) (sideBySide (rotate blackHorse) (rotate horse))

-- Exercise 2.5 Producing a fourth variant1

variant4 :: Picture
variant4 = above (sideBySide horse blackHorse) (sideBySide (flipH blackHorse) (flipH horse))