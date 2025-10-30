using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Drawing;
using System.Drawing.Imaging;

public partial class WebForm1 : System.Web.UI.Page
{
    // This structure holds the details of each of the slices 
    public struct Slice
    {
        public string stageName;
        public int value;
        public double dollars;
        public Point[] coordinates;
        public Color color;
    }

    /// <summary>
    /// This contains the outer bounds of the funnel
    /// </summary>
    private Point[] FUNNEL_BOUNDS = new Point[]{
            new Point(75,2),
            new Point(125,108),
            new Point(145,108),
            new Point(195,2)};
    private Color[] colorPalette = new Color[] 
                            {Color.LightSkyBlue,Color.LightGreen,
                                Color.PaleVioletRed,Color.SteelBlue, Color.DarkSalmon, Color.Maroon};

    # region "Constants"

    //private const int FUNNEL_HEIGHT = 122;
    private const int FUNNEL_HEIGHT = 106;
    private const int IMAGE_WIDTH = 291;
    private const int IMAGE_HEIGHT = 160;//139;
    private const int SLICE_GAP = 1;
    private const string IMAGE_FORMAT = "image/jpeg";

    # endregion

    private int maxSlice;
    private int curSlice;
    private int totalVal;
    private Slice[] funnelSlices;
    private Bitmap chartBMP;
    private Graphics graphicsObj;
    private Font labelFont = new Font("Verdana", 8);
    //private Font msgFont = new Font("", 10);
    private SolidBrush fontBrush = new SolidBrush(Color.Black);
    private int labelTop;  // Labels besides the funnel slices. 
    private int labelBottom; // Labels besides the funnel slices, go through the screen shot.

    private DataSet snapshotData;
    private int loggedInUserId;


    /// <summary>
    /// This method initializes the funnel
    /// </summary>
    public void InitFunnel(int count)
    {
        try
        {
            maxSlice = count;
            funnelSlices = new Slice[count];

            chartBMP = new Bitmap(IMAGE_WIDTH, IMAGE_HEIGHT, PixelFormat.Format32bppArgb);
            graphicsObj = Graphics.FromImage(chartBMP);
            // Draw the background
            graphicsObj.FillRectangle(new SolidBrush(Color.White), 0, 0, IMAGE_WIDTH, IMAGE_HEIGHT);

        }
        catch (Exception ex)
        {
            throw new Exception("Error initialising funnel", ex);
        }
    }

    /// <summary>
    /// Calculates the height from where the slice has to be plotted 
    /// </summary>
    private int GetHeight(int sliceIndex)
    {
        // Get the height for this slice as a proportion of the total value
        return (int)((double)funnelSlices[sliceIndex].value / totalVal * FUNNEL_HEIGHT);
    }


    //    0-------------3
    //     \           /
    //      \         /
    //      1\_______/2
    /// <summary>
    /// Calculates the coordinates of the slice
    /// </summary>
    private void GetCoordinates(int sliceIndex)
    {
        int sliceHeight;

        // Calculate the top points ie, 0 & 3
        if (sliceIndex == 0)
        {
            // The top 2 points are same as the funnel
            funnelSlices[sliceIndex].coordinates[0] = FUNNEL_BOUNDS[0];
            funnelSlices[sliceIndex].coordinates[3] = FUNNEL_BOUNDS[3];
        }
        else
        {
            // The top 2 points are same as the bottom 2 points of the previous slice
            funnelSlices[sliceIndex].coordinates[0] = funnelSlices[sliceIndex - 1].coordinates[1];
            funnelSlices[sliceIndex].coordinates[3] = funnelSlices[sliceIndex - 1].coordinates[2];
        }


        // Calculate the bottom 2 points ie, 1 & 2
        if (sliceIndex == funnelSlices.Length - 1)
        {
            // The bottom 2 points are same as the funnel
            funnelSlices[sliceIndex].coordinates[1] = FUNNEL_BOUNDS[1];
            funnelSlices[sliceIndex].coordinates[2] = FUNNEL_BOUNDS[2];
        }
        else
        {

            sliceHeight = GetHeight(sliceIndex);
            // Calculate the other 2 points using the 2 point equation
            // Use Point 0 & 1 of the funnel to calculate point 1 of the slice
            funnelSlices[sliceIndex].coordinates[1].Y = funnelSlices[sliceIndex].coordinates[0].Y + sliceHeight;
            funnelSlices[sliceIndex].coordinates[1].X =
                GetX(
                FUNNEL_BOUNDS[0].X, FUNNEL_BOUNDS[0].Y,
                FUNNEL_BOUNDS[1].X, FUNNEL_BOUNDS[1].Y,
                funnelSlices[sliceIndex].coordinates[1].Y);

            // Use Point 2 & 3 of the funnel to calculate point 2 of the slice
            funnelSlices[sliceIndex].coordinates[2].Y = funnelSlices[sliceIndex].coordinates[0].Y + sliceHeight;
            funnelSlices[sliceIndex].coordinates[2].X =
                GetX(
                FUNNEL_BOUNDS[2].X, FUNNEL_BOUNDS[2].Y,
                FUNNEL_BOUNDS[3].X, FUNNEL_BOUNDS[3].Y,
                funnelSlices[sliceIndex].coordinates[2].Y);

        }
    }

    /// <summary>
    /// This method returns the x coordinate on the line defined by
    /// (x1, y1) and (x2, y2) for a given y. 
    /// </summary>
    private int GetX(int x1, int y1, int x2, int y2, int y)
    {
        return (x2 - x1) * (y - y1) / (y2 - y1) + x1;
    }


    /// <summary>
    /// Adds required slice with the name, value, associated revenue and color
    /// </summary>
    public void AddSlice(string name, int value, double dollars, Color sliceClr)
    {
        // Throw exception if it exceeds the max
        // Create a new slice object and set the values
        Slice newSlice = new Slice();
        newSlice.coordinates = new Point[4];
        newSlice.stageName = name;
        newSlice.value = value;
        newSlice.dollars = dollars;
        newSlice.color = sliceClr;

        // Place it in the Slice[] array at appropriate location
        funnelSlices[curSlice++] = newSlice;

        // Update the total value
        totalVal += value;
    }


    /// <summary>
    /// This method adds the gaps between the slices
    /// </summary>
    public void AddGaps(int i)
    {
        funnelSlices[i].coordinates[0].Y = funnelSlices[i].coordinates[0].Y + i * SLICE_GAP;
        funnelSlices[i].coordinates[1].Y = funnelSlices[i].coordinates[1].Y + i * SLICE_GAP;
        funnelSlices[i].coordinates[2].Y = funnelSlices[i].coordinates[2].Y + i * SLICE_GAP;
        funnelSlices[i].coordinates[3].Y = funnelSlices[i].coordinates[3].Y + i * SLICE_GAP;

    }


    /// <summary>
    /// This method plots the graph.
    /// To be called after all the values have been initialized
    /// </summary>
    public void PlotGraph()
    {
        int i;
        SizeF strSz;
        string label;

        labelTop = FUNNEL_BOUNDS[0].Y;
        // Throw exception if all slices not initialised
        // Repeat the following steps for each of the slices
        for (i = 0; i < maxSlice; i++)
        {
            // Get the coordinates of the slice
            GetCoordinates(i);
        }

        // Get the height of the font
        int labelHeight = (int)graphicsObj.MeasureString("B", labelFont).Height;
        for (i = 0; i < maxSlice; i++)
        {
            // Add gaps between slices
            AddGaps(i);

            // Calculate label top (and bottom for next loop)
            labelTop = (funnelSlices[i].coordinates[0].Y > labelBottom + 1 ? funnelSlices[i].coordinates[0].Y : labelBottom + 1);
            labelBottom = labelTop + labelHeight;

            // Plot the graph
            graphicsObj.FillPolygon(new SolidBrush(funnelSlices[i].color), funnelSlices[i].coordinates);

            // Add the stage name label on the left
            strSz = graphicsObj.MeasureString(funnelSlices[i].stageName, labelFont);
            graphicsObj.DrawString(funnelSlices[i].stageName, labelFont, fontBrush, funnelSlices[i].coordinates[0].X - strSz.Width, labelTop);



            // Add the value label on the right
            label = ((funnelSlices[i].dollars)).ToString("C0") + "(" + funnelSlices[i].value.ToString() + ")";
            graphicsObj.DrawString(label, labelFont, fontBrush, funnelSlices[i].coordinates[3].X, labelTop);
        }
        strSz = graphicsObj.MeasureString(label, labelFont);

        int funnelWidth = (FUNNEL_BOUNDS[3].X - FUNNEL_BOUNDS[0].X);
        int labelX = FUNNEL_BOUNDS[0].X + (int)(funnelWidth / 2 - strSz.Width / 2);
        int labelY = (int)(IMAGE_HEIGHT - strSz.Height);


        graphicsObj.DrawString(label, labelFont, fontBrush, labelX, labelY);

        Response.ContentType = IMAGE_FORMAT;
        chartBMP.Save(Response.OutputStream, ImageFormat.Jpeg);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        // Load data from the database or xml data
        LoadData(10); // Random number added.
    }

    private void LoadData(int sliceCount)
    {

        InitFunnel(sliceCount);
        if (sliceCount > 0)
        {

            for (int i = 0; i < sliceCount; i++)
            {
                // Have added random numbers. Let me know if you have any doubts.
                AddSlice("Slice name", 100, 200.90, colorPalette[i % colorPalette]);
            }
            PlotGraph();
        }
    }
}

