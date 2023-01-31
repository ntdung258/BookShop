package bookshop.controller.user;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.client.HttpClientErrorException.BadRequest;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class ExceptionController {

	@ExceptionHandler(NullPointerException.class)
	public String nullPointer() {
		return "/err-pages/null-pointer";
	}

	@ResponseStatus(value = HttpStatus.NOT_FOUND) // 404
	@ExceptionHandler(NoHandlerFoundException.class)
	public String noHandlerFound() {
		return "/err-pages/404";
	}

	@ExceptionHandler(BadRequest.class)
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	public String badRequest() {
		return "/err-pages/400";
	}
}
