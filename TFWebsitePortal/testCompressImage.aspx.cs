using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Extuent
{
    public partial class testCompressImage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void compressimagesize(double scaleFactor, string sourcePath, string targetPath)
        {
            try
            {
                using (var image = System.Drawing.Image.FromFile(sourcePath))
                {
                    //  var imgnewwidth = (int)(image.Width * scaleFactor);
                    // var imgnewheight = (int)(image.Height * scaleFactor);

                    var imgnewwidth = (int)(300);
                    var imgnewheight = (int)(300);

                    var imgthumnail = new Bitmap(imgnewwidth, imgnewheight);
                    var imgthumbgraph = Graphics.FromImage(imgthumnail);
                    imgthumbgraph.CompositingQuality = CompositingQuality.HighQuality;
                    imgthumbgraph.SmoothingMode = SmoothingMode.HighQuality;
                    imgthumbgraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
                    var imageRectangle = new Rectangle(0, 0, imgnewwidth, imgnewheight);
                    imgthumbgraph.DrawImage(image, imageRectangle);
                    imgthumnail.Save(targetPath, image.RawFormat);
                }
            }
            catch { }
        }
        private void compressimagesizeUpload(double scaleFactor, Stream sourcePath, string targetPath)
        {
            using (var image = System.Drawing.Image.FromStream(sourcePath))
            {
                var imgnewwidth = (int)(image.Width * scaleFactor);
                var imgnewheight = (int)(image.Height * scaleFactor);
                var imgthumnail = new Bitmap(imgnewwidth, imgnewheight);
                var imgthumbgraph = Graphics.FromImage(imgthumnail);
                imgthumbgraph.CompositingQuality = CompositingQuality.HighQuality;
                imgthumbgraph.SmoothingMode = SmoothingMode.HighQuality;
                imgthumbgraph.InterpolationMode = InterpolationMode.HighQualityBicubic;
                var imageRectangle = new Rectangle(0, 0, imgnewwidth, imgnewheight);
                imgthumbgraph.DrawImage(image, imageRectangle);
                imgthumnail.Save(targetPath, image.RawFormat);
            }
        }
        protected void btnsave_Click(object sender, EventArgs e)
        {
            string filename;//= Path.GetFileName(FileUpload1.PostedFile.FileName);
            string targetPath;//= Server.MapPath("UPdImg/" + filename);
            string saveimage; //= "UPdImg/" + filename + "";
            //Stream strm = FileUpload1.PostedFile.InputStream;
            string strm="";
            string contents;
            string folderPath = @"C:\Users\abhis\OneDrive\Desktop\All Large Images";
            string folderPathOutput = @"C:\Users\abhis\OneDrive\Desktop\UPdImg\";

            foreach (string file in Directory.EnumerateFiles(folderPath, "*"))
            {
                 filename = Path.GetFileName(file);
                 targetPath = folderPathOutput + filename;
                 saveimage = folderPathOutput + filename + "";
                var targetFile = targetPath;

                //contents = File.ReadAllText(file);
                strm = file;
                compressimagesize(0.5, strm, targetFile);

            }

            

            
        }
        protected void btnsave_Click1(object sender, EventArgs e)
        {
            string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
            string targetPath = Server.MapPath("Images/" + filename);
            string saveimage = "Images/" + filename + "";
            Stream strm = FileUpload1.PostedFile.InputStream;
            var targetFile = targetPath;

            compressimagesizeUpload(0.5, strm, targetFile);
        }
    }
}
