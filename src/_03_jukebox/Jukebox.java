package _03_jukebox;
/*
 *    Copyright (c) The League of Amazing Programmers 2013-2019
 *    Level 1
 */


import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.net.URL;

import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingUtilities;

import javazoom.jl.player.advanced.AdvancedPlayer;

/*   If you don't have javazoom.jar in your project, you can download it from here: http://bit.ly/javazoom
 *   Right click your project and add it as a JAR (Under Java Build Path > Libraries).*/

public class Jukebox implements Runnable, MouseListener{
	
	JButton song1;
	JButton song2;
	JButton song3; 
	JButton song4;
	JButton stop;

	Song Breakaway;
	Song Budapest;
	Song LeavingItUpToYou;
	Song Barcelona;
	
    public void run() {

		// 1. Find an mp3 on your computer or on the Internet.
		// 2. Create a Song object for that mp3
    	

Breakaway = new Song("George Ezra/Wanted On Voyage/10 Breakaway.mp3");
Budapest = new Song("George Ezra/Wanted On Voyage/02 Budapest.mp3");
LeavingItUpToYou = new Song("George Ezra/Wanted On Voyage/06 Leaving It Up To You.mp3");
Barcelona = new Song("George Ezra/Wanted On Voyage/04 Barcelona.mp3");

		// 3. Play the Song
//Breakaway.play();
		/*
		 * 4. Create a user interface for your Jukebox so that the user can to
		 * choose which song to play. You can use can use a different button for
		 * each song, or a picture of the album cover. When the button or album
		 * cover is clicked, stop the currently playing song, and play the one
		 * that was selected.
		 */
JFrame frame = new JFrame();
JPanel panel = new JPanel();
song1 = new JButton("Breakaway");
song2 = new JButton("Budapest");
song3 = new JButton("Leaving It Up To You");
song4 = new JButton("Barcelona");
stop = new JButton("stop");
frame.add(panel);
panel.add(song4);
panel.add(song3);
panel.add(song2);
panel.add(song1);
panel.add(stop);
song1.addMouseListener(this);
song2.addMouseListener(this);
song3.addMouseListener(this);
song4.addMouseListener(this);
stop.addMouseListener(this);
frame.pack();
frame.setVisible(true);


    }
    
    
	/* Use this method to add album covers to your Panel. */
	private JLabel loadImage(String fileName) {
		URL imageURL = getClass().getResource(fileName);
		Icon icon = new ImageIcon(imageURL);
		return new JLabel(icon);
	}


	@Override
	public void mouseClicked(MouseEvent e) {
		// TODO Auto-generated method stub
		Breakaway.stop();
		Budapest.stop();
		LeavingItUpToYou.stop();
		Barcelona.stop();
		if(e.getSource() == song1) {
			Breakaway.play();
		}
		else if(e.getSource() == song2) {
			Budapest.play();
		}
		else if (e.getSource() == song3) {
			LeavingItUpToYou.play();
		}
		else if(e.getSource() == song4) {
			Barcelona.play();
		}
		else if(e.getSource() == stop) {
			
		}
	}


	@Override
	public void mousePressed(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void mouseReleased(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void mouseEntered(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void mouseExited(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

}

class Song {

	private int duration;
	private String songAddress;
	private AdvancedPlayer mp3Player;
	private InputStream songStream;

	/**
	 * Songs can be constructed from files on your computer or Internet
	 * addresses.
	 * 
	 * Examples: <code> 
	 * 		new Song("everywhere.mp3"); 	//from default package 
	 * 		new Song("/Users/joonspoon/music/Vampire Weekend - Modern Vampires of the City/03 Step.mp3"); 
	 * 		new	Song("http://freedownloads.last.fm/download/569264057/Get%2BGot.mp3"); 
	 * </code>
	 */
	public Song(String songAddress) {
		this.songAddress = songAddress;
	}

	public void play() {
		loadFile();
		if (songStream != null) {
			loadPlayer();
			startSong();
		} else
			System.err.println("Unable to load file: " + songAddress);
	}

	public void setDuration(int seconds) {
		this.duration = seconds * 100;
	}

	public void stop() {
		if (mp3Player != null)
			mp3Player.close();
	}

	private void startSong() {
		Thread t = new Thread() {
			public void run() {
				try {
					if (duration > 0)
						mp3Player.play(duration);
					else
						mp3Player.play();
				} catch (Exception e) {
				}
			}
		};
		t.start();
	}

	private void loadPlayer() {
		try {
			this.mp3Player = new AdvancedPlayer(songStream);
		} catch (Exception e) {
		}
	}

	private void loadFile() {
		if (songAddress.contains("http"))
			this.songStream = loadStreamFromInternet();
		else
			this.songStream = loadStreamFromComputer();
	}

	private InputStream loadStreamFromInternet() {
		try {
			return new URL(songAddress).openStream();
		} catch (Exception e) {
			return null;
		}
	}

	private InputStream loadStreamFromComputer() {
		try {
			return new FileInputStream(songAddress);
		} catch (FileNotFoundException e) {
			return this.getClass().getResourceAsStream(songAddress);
		}
	}
}

