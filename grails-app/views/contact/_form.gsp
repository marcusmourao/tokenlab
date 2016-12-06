<%@ page import="br.ufscar.tokenlab.Contact" %>



<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="contact.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${contactInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'birthday', 'error')} required">
	<label for="birthday">
		<g:message code="contact.birthday.label" default="Birthday" />
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

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="contact.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${contactInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'phone', 'error')} required">
	<label for="phone">
		<g:message code="contact.phone.label" default="Phone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="phone" required="" value="${contactInstance?.phone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contactInstance, field: 'owner', 'error')} required">
	<label for="owner">
		<g:message code="contact.owner.label" default="Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="owner" name="owner.id" from="${br.ufscar.tokenlab.User.list()}" optionKey="id" required="" value="${contactInstance?.owner?.id}" class="many-to-one"/>

</div>

