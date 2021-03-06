package controllers

import (
	"fmt"

	"github.com/code-mobi/hotel/models"
)

type MainController struct {
	BaseController
}

type SearchRoom struct {
	CheckInDate  string
	CheckOutDate string
}

type RoomBookingForm struct {
	RoomBookingNo string
	CheckInDate   string
	CheckOutDate  string
	Firstname     string
	Lastname      string
	CardID        string
	ContactNo     string
}

func (c *MainController) Get() {
	c.GetUserLogin()
	c.TplNames = "index.tpl"
	hotelSystem := models.GetInstance()
	searchRoom := SearchRoom{}
	if err := c.ParseForm(&searchRoom); err != nil {

	}
	c.Data["SearchRoom"] = searchRoom
	if searchRoom.CheckInDate != "" && searchRoom.CheckOutDate != "" {
		c.Data["Rooms"] = hotelSystem.GetAvailableRoom(searchRoom.CheckInDate, searchRoom.CheckOutDate)
	}
}

func (c *MainController) Post() {
	user := c.GetUserLogin()
	c.TplNames = "apps/booking.tpl"
	hotelSystem := models.GetInstance()
	searchRoom := SearchRoom{}
	if err := c.ParseForm(&searchRoom); err != nil {

	}
	c.Data["SearchRoom"] = searchRoom

	roomNos := make([]string, 0, 2)
	c.Ctx.Input.Bind(&roomNos, "RoomNo")

	extraBeds := make([]bool, 0, 2)
	c.Ctx.Input.Bind(&extraBeds, "ExtraBed")

	roomBooking := hotelSystem.ReserveRoom(user, roomNos, extraBeds, searchRoom.CheckInDate, searchRoom.CheckOutDate)
	c.Redirect(fmt.Sprintf("/roombooking/%s", roomBooking.RoomBookingNo), 302)
}
