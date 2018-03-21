function updateEvent(eventId, eventName, eventDate, eventLocation) {
	//Populate the input tags of the edit event form
	$("#editEventId").val(eventId);
	$("#editEventName").val(eventName);
	$("#editEventDate").val(eventDate);
	$("#editLocation").val(eventLocation);
}