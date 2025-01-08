package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func main() {
	// Create a new Gin router with default middleware
	router := gin.Default()

	// Define a simple GET route
	router.GET("/", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"message": "Welcome to Gin Framework!",
		})
	})

	// Define a route with path parameter
	router.GET("/hello/:name", func(c *gin.Context) {
		name := c.Param("name")
		c.JSON(http.StatusOK, gin.H{
			"message": "Hello " + name + "!",
		})
	})

	// Define a route with query parameter
	router.GET("/query", func(c *gin.Context) {
		name := c.DefaultQuery("name", "Guest")
		c.JSON(http.StatusOK, gin.H{
			"message": "Hello " + name + "!",
		})
	})

	// Define a POST route
	router.POST("/post", func(c *gin.Context) {
		type RequestBody struct {
			Name string `json:"name"`
		}

		var body RequestBody
		if err := c.BindJSON(&body); err != nil {
			c.JSON(http.StatusBadRequest, gin.H{
				"error": err.Error(),
			})
			return
		}

		c.JSON(http.StatusOK, gin.H{
			"message": "Hello " + body.Name + "!",
		})
	})

	// Run the server on port 8080
	router.Run(":8080")
}
