import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;

import org.krysalis.barcode4j.impl.code128.Code128Bean;
import org.krysalis.barcode4j.impl.code128.Code128Constants;
import org.krysalis.barcode4j.output.bitmap.BitmapCanvasProvider;
import org.krysalis.barcode4j.tools.UnitConv;

public class Main {

  public static void main(String[] args) {
    String barcodeString = "T21021900097";
    try {
      Code128Bean barcode128Bean = new Code128Bean();
      barcode128Bean.setCodeset(Code128Constants.CODESET_B);
      final int dpi = 100;

      // Configure the barcode generator
      // adjust barcode width here
      barcode128Bean.setModuleWidth(UnitConv.in2mm(5.0f / dpi));
      barcode128Bean.doQuietZone(false);

      // Open output file
      File outputFile = new File("barcode.png");
      OutputStream out = new FileOutputStream(outputFile);
      BitmapCanvasProvider canvasProvider = new BitmapCanvasProvider(out, "image/x-png", dpi,
          BufferedImage.TYPE_BYTE_BINARY, false, 0);

      barcode128Bean.generateBarcode(canvasProvider, barcodeString);

      canvasProvider.finish();
      out.close();
    } catch (Exception e) {
      // TODO: handle exception
    } finally {
    }
  }

}
