package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UploadImgController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String workspacePath=System.getProperty("user.home")+"\\git\\greenscent\\semi-project\\WebContent\\uploadImg\\";
		int sizeLimit = 1024*1024*10;
		MultipartRequest multi = new MultipartRequest(request, workspacePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		String fileName=multi.getFilesystemName("picture");
		System.out.println(fileName);
		String orgName = multi.getOriginalFileName("picture");
		System.out.println(orgName);
		JSONObject result = new JSONObject();
		result.put("fileName", fileName);
		result.put("orgName",orgName);
		request.setAttribute("responsebody",result);
		return "AjaxView";
	}

}
