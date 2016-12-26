<?php

/**
 * Products
 *
 */
class Products
{
    /**
     * @var integer
     */
    private $id;

    /**
     */
    private $productName;

    /**
     * @var float
     *
     */
    private $productPrice;

    /**
     * @var string
     *
     */
    private $productDescription;


    /**
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set productName
     *
     * @param string $productName
     * @return Products
     */
    public function setProductName($productName)
    {
        $this->productName = $productName;

        return $this;
    }

    /**
     * Get productName
     *
     * @return string 
     */
    public function getProductName()
    {
        return $this->productName;
    }

    /**
     * Set productPrice
     *
     * @param float $productPrice
     * @return Products
     */
    public function setProductPrice($productPrice)
    {
        $this->productPrice = $productPrice;

        return $this;
    }

    /**
     * Get productPrice
     *
     * @return float 
     */
    public function getProductPrice()
    {
        return $this->productPrice;
    }

    /**
     * Set productDescription
     *
     * @param string $productDescription
     * @return Products
     */
    public function setProductDescription($productDescription)
    {
        $this->productDescription = $productDescription;

        return $this;
    }

    /**
     * Get productDescription
     *
     * @return string 
     */
    public function getProductDescription()
    {
        return $this->productDescription;
    }
}
