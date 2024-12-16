import 'dart:async';

import 'package:edugated/domain/entities/contact.dart';
import 'package:edugated/domain/failures/contacts_failure.dart';
import 'package:edugated/domain/repositories/contacts.repository.dart';
import 'package:fpdart/fpdart.dart';

class MockContactsRepository implements ContactsRepository {
  @override
  Future<Either<ContactsFailure, List<Contact>>> getContacts(
          Map<String, String> data) async =>
      right([
        Contact(
            id: "123",
            userId: "2",
            name: "Mock Name",
            phone: "443434",
            type: "friend",
            cnicImage: "cnicImage",
            userType: "student"),
        Contact(
            id: "123",
            userId: "2",
            name: "Mock Name",
            phone: "443434",
            type: "friend",
            cnicImage: "cnicImage",
            userType: "student"),
        Contact(
            id: "123",
            userId: "2",
            name: "Mock Name",
            phone: "443434",
            type: "friend",
            cnicImage: "cnicImage",
            userType: "student"),
        Contact(
            id: "123",
            userId: "2",
            name: "Mock Name",
            phone: "443434",
            type: "friend",
            cnicImage: "cnicImage",
            userType: "student"),
        Contact(
            id: "123",
            userId: "2",
            name: "Mock Name",
            phone: "443434",
            type: "friend",
            cnicImage: "cnicImage",
            userType: "student"),
        Contact(
            id: "123",
            userId: "2",
            name: "Mock Name",
            phone: "443434",
            type: "friend",
            cnicImage: "cnicImage",
            userType: "student"),
      ]);
}
