import java.io.*;
import java.net.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Class for handling the responses. Server takes in a string from client, 
 * adds a timestamp and then sends the concatenated string back to the client
 * @author likeamojay
 *
 */ final class JimboSnakeServer extends Thread
{
   private static final int PORT=7890;
   static InetAddress address;
   static ServerSocket server;

   //Default constructor
   private JimboSnakeServer() {}

   public static void main(String args[]) throws UnknownHostException
   {
	   // set IP Address
	address = InetAddress.getByName("localhost");
	
	  // Initialize server
	  JimboSnakeServer JimboSnakeServer = new JimboSnakeServer();
      if(JimboSnakeServer !=null) {JimboSnakeServer.start();}
   }

   public void run()
   {
	 
	   
      try
      {
         server = new ServerSocket(PORT, 1,address);
         Socket client = server.accept();

         BufferedReader reader = new BufferedReader(
            new InputStreamReader(client.getInputStream()));

         PrintWriter writer = new PrintWriter(new BufferedWriter(
            new OutputStreamWriter(client.getOutputStream())));

         String line = reader.readLine();
         System.out.println("Received: "+line);

         // Create new date at current time
         DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
         Date scoreDate = new Date();
         
         // Write Back, Name, Score and Timestamp
         writer.println(line + " "+dateFormat.format(scoreDate));
        
         // Close the writer and server
         writer.flush();
        
      }
      catch(IOException ie)
      {
         ie.printStackTrace();
         System.out.println(ie);
      }
      
   }
  
}   
 
 