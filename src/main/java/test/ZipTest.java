package test;
 
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
 
public class ZipTest {
 
  public static void main(String[] args) {
    // ����Ǿ� ������ ���ϸ�
    String zip_filename = "C:/ai5/temp/swiss.zip"; 
    
    String[] zip_src = new String[3];
    zip_src[0] = "C:/ai5/ws_frame/jsp_test/src/test/sw01.jpg";
    zip_src[1] = "C:/ai5/ws_frame/jsp_test/src/test/sw02.jpg";
    zip_src[2] = "C:/ai5/ws_frame/jsp_test/src/test/sw03.jpg";
    
    byte[] buffer = new byte[4096]; // 4 KB
    
    try {
      ZipOutputStream zipOutputStream = new ZipOutputStream(new FileOutputStream(zip_filename));
      
      for(int index=0; index < zip_src.length; index++) {
        FileInputStream in = new FileInputStream(zip_src[index]);
        
        Path path = Paths.get(zip_src[index]);
        String zip_src_file = path.getFileName().toString();
        System.out.println("zip_src_file: " + zip_src_file); // ����Ǵ� ���ϸ� ���
        
        ZipEntry zipEntry = new ZipEntry(zip_src_file);
        zipOutputStream.putNextEntry(zipEntry);
        
        int length = 0;
        // 4 KB�� �о buffer �迭�� ������ ���� ����Ʈ���� length�� ����
        while((length = in.read(buffer)) > 0) {
          zipOutputStream.write(buffer, 0, length); // ����� ����, ���뿡���� ���� ��ġ, ����� ����
          
        }
        zipOutputStream.closeEntry();
        in.close();
      }
      zipOutputStream.close();
      
      File file = new File(zip_filename);
      
      if (file.exists() && file.length() > 0) {
        System.out.println(zip_filename + "�� ���� ���� ������.");
      }
      
//      if (file.delete() == true) {
//        System.out.println(zip_filename + " ������ �����߽��ϴ�.");
//      }
 
    } catch (FileNotFoundException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    }
 
  }
 
}