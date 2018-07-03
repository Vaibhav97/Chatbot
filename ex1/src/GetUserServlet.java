import com.ibm.watson.developer_cloud.assistant.v1.Assistant;
import com.ibm.watson.developer_cloud.assistant.v1.model.InputData;
import com.ibm.watson.developer_cloud.assistant.v1.model.MessageOptions;
import com.ibm.watson.developer_cloud.assistant.v1.model.MessageResponse;
import com.ibm.watson.developer_cloud.assistant.v1.model.RuntimeIntent;
import java.util.List;
import java.util.Scanner;
import java.util.logging.LogManager;import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.*;

public class GetUserServlet extends HttpServlet {
public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    doPost(request, response);
}

public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    // Set up Assistant service.
    Assistant service = new Assistant("2018-02-16");
    service.setUsernameAndPassword("3cb338bb-3577-4be6-abd0-e988c3af2dbf", "oUFfiAfVfNvq");
    String workspaceId = "b26aa529-7943-4b51-b612-5223a528871e"; // replace with workspace ID

    // Initialize with empty value to start the conversation.
    MessageOptions options = new MessageOptions.Builder(workspaceId).build();
    String name = request.getParameter("name");
    PrintWriter out = response.getWriter(); 
    InputData input = new InputData.Builder(name).build();
    options = new MessageOptions.Builder(workspaceId).input(input).build();

    // Main input/output loop
      // Send message to Assistant service.
      MessageResponse response1 = service.message(options).execute();      
      String responseText = response1.getOutput().getText().get(0);
      // List<RuntimeIntent> responseIntents = response1.getIntents();

      // If an intent was detected, print it to the console.
      // if(responseIntents.size() > 0) {
      //   //out.println("Detected intent: #" + responseIntents.get(0).getIntent());
      // }
      // Print the output from dialog, if any.
      out.println(responseText);
}
}
