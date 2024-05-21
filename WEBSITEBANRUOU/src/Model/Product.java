package Model;

public class Product {
    private String productID;
    private String productName;
    private String productType;
    private double productPrice;
    private String productImg;
    private boolean isTrend;
    private boolean isPopular;
    private boolean isSaleoff;

//    public Product() {
//        // Default constructor
//    }

    public Product(String productID, String productName, String productType, double productPrice,
                   String productImg, boolean isTrend, boolean isPopular, boolean isSaleoff) {
        this.productID = productID;
        this.productName = productName;
        this.productType = productType;
        this.productPrice = productPrice;
        this.productImg = productImg;
        this.isTrend = isTrend;
        this.isPopular = isPopular;
        this.isSaleoff = isSaleoff;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductType() {
        return productType;
    }

    public void setProductType(String productType) {
        this.productType = productType;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductImg() {
        return productImg;
    }

    public void setProductImg(String productImg) {
        this.productImg = productImg;
    }

    public boolean isTrend() {
        return isTrend;
    }

    public void setTrend(boolean isTrend) {
        this.isTrend = isTrend;
    }

    public boolean isPopular() {
        return isPopular;
    }

    public void setPopular(boolean isPopular) {
        this.isPopular = isPopular;
    }

    public boolean isSaleoff() {
        return isSaleoff;
    }

    public void setSaleoff(boolean isSaleoff) {
        this.isSaleoff = isSaleoff;
    }
}
 
