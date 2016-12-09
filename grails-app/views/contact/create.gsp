<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contact.label', default: 'Contato')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-contact" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-contact" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${contactInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${contactInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:contactInstance, action:'save']" >
				<fieldset class="form">
					<%@ page import="br.ufscar.tokenlab.Contact" %>



					<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'name', 'error')} required">
						<label for="name">
							<g:message code="contact.name.label" default="Nome" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="name" required="" value="${contactInstance?.name}"/>

					</div>

					<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'birthday', 'error')} required">
						<label for="birthday">
							<g:message code="contact.birthday.label" default="Data de aniversário" />
							<span class="required-indicator">*</span>
						</label>
						<g:datePicker name="birthday" precision="day"  value="${contactInstance?.birthday}"  />

					</div>

					<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'email', 'error')} required">
						<label for="email">
							<g:message code="contact.email.label" default="Email" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="email" required="" value="${contactInstance?.email}"/>

					</div>

					<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'phone', 'error')} required">
						<label for="phone">
							<g:message code="contact.phone.label" default="Telefone" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="phone" required="" value="${contactInstance?.phone}"/>

					</div>


					<div class="fieldcontain required">
						<label for="zipcode">
							<g:message code="contact.zipcode.label" default="Cep" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField id="zipcode" onblur="" name="zipcode" required="" value="${}"/>
					</div>

					<div class="fieldcontain required">
						<label for="place">
							<g:message code="contact.place.label" default="Logradouro" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField id="place"  name="place" required="" />
					</div>

					<div class="fieldcontain required">
						<label for="number">
							<g:message code="contact.numer.label" default="Número" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField id="number" name="number" required="" />
					</div>

					<div class="fieldcontain ">
						<label for="complement">
							<g:message code="contact.complement.label" default="Complemento" />
						</label>
						<g:textField id="complement" name="complement" />
					</div>

					<div class="fieldcontain required">
						<label for="neighborhood">
							<g:message code="contact.neighborhood.label" default="Bairro" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField id="neighborhood" name="neighborhood" required=""/>
					</div>

					<div class="fieldcontain required">
						<label for="city">
							<g:message code="contact.city.label" default="Cidade" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField id="city" name="city" required="" />
					</div>

					<div class="fieldcontain required">
						<label for="state">
							<g:message code="contact.state.label" default="Estado" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField id="state" name="state" required="" />
					</div>

					<input type="hidden" id="address" name="address" value="address" />

				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>

	<script type="text/javascript" >

		$(document).ready(function() {
			$("#zipcode").blur(function() {
				var zipcode = $(this).val();
				$.getJSON("//viacep.com.br/ws/" + zipcode + "/json/?callback=?", function (data) {
					if (!("erro" in data)) {
						$("#place").val(data.logradouro);
						$("#neighborhood").val(data.bairro);
						$("#city").val(data.localidade);
						$("#state").val(data.uf);
					}
					else {
						alert("CEP não encontrado.");
					}
				});
			});
		});
	</script>
	</body>
</html>
