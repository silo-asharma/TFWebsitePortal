using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FFMpegSharp;
using FFMpegSharp.FFMPEG;
using System.IO;
using FFMpegSharp.Enums;
using FFMpegSharp.FFMPEG.Enums;
using FFMpegSharp.FFMPEG.Arguments;
namespace Extuent
{
    public partial class test_ffmeg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //string inputFile = "input_path_goes_here";
          //      FFMpeg encoder = new FFMpeg();
                //FileInfo outputFile = new FileInfo("output_path_goes_here");
                //var video = VideoInfo.FromPath(inputFile);



                //var container = new ArgumentsContainer();
                //container.Add(new VideoCodecArgument(VideoCodec.LibVpx));
                //container.Add(new ScaleArgument(VideoSize.Hd));

                //var ffmpeg = new FFMpeg();
                //var resulterrr = ffmpeg.Convert(container, new FileInfo("D://abhi.webm"), new FileInfo("D://abhi1.webm"));
        }
            catch (Exception ex) { }
        }
    }
}