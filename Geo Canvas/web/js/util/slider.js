function Slider(sliderName, data, slideName, lblName)
{
    // To keep the sliding images. The format of the data must be
    // imageData[0] = ["image's url","image's website","image's label"];
    // e.g 
    // var imageData = new Array();
    // imageData[0] = {url : "http://www.yourwebsite.com/image01.jpg", site : "http://www.yourwebsite.com", title : "sample image 1"};
    // imageData[1] = {url : "http://www.yourwebsite.com/image02.jpg", site : "http://www.yourwebsite.com", title : "sample image 2"};
    
    this.sliderName = sliderName;
    this.imageData = data; 
    this.sliderDivName = slideName;
    this.labelDivName = lblName;
    
    // Image index
    this.imgIndex = 0;
    
    // To control timer
    this.timerControl = null;
}

Slider.prototype.playSlide = function(index)
{
    if(index > this.imageData.length)
        index = 0;    
    this.imgIndex = index;
    this.timerControl = window.setTimeout(this.sliderName + ".showImage()", 1000);    
};


Slider.prototype.showImage = function()
{
    if(this.imgIndex > this.imageData.length - 1)
        this.imgIndex = 0;
    
    var url = this.imageData[this.imgIndex].url;
    var sliderDiv = document.getElementById(this.sliderDivName);
    this.imgIndex++;
    
    sliderDiv.innerHTML = "index : " + this.imgIndex + " url : " + url + " <img src='" + url + "' border='0' style='background:red;width:100px;height:100px;' />";
    this.timerControl = window.setTimeout(this.sliderName + ".showImage()", 1000);  
};